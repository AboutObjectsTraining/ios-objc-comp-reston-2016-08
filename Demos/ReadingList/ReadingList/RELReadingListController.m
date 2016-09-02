#import "RELReadingListController.h"
#import "RELBookDetailController.h"

#import "ReadingListStore.h"
#import "ReadingList.h"
#import "Author.h"
#import "Book.h"

@interface RELReadingListController ()
@property (nonatomic, strong) ReadingListStore *store;
@property (nonatomic, strong) ReadingList *readingList;
@end


@implementation RELReadingListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.store = [ReadingListStore storeWithName:@"BooksAndAuthors"];
    self.readingList = self.store.fetchedReadingList;
    
    NSLog(@"%@", self.readingList);
}

- (IBAction)doneEditingBook:(UIStoryboardSegue *)segue
{
    [self.tableView reloadData];
    [self.store saveReadingList:self.readingList];
}

- (IBAction)cancelEditingBook:(UIStoryboardSegue *)segue { }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RELBookDetailController *detailController = segue.destinationViewController;
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    
    detailController.book = self.readingList.books[indexPath.row];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.readingList.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookSummary"];
    
    Book *book = self.readingList.books[indexPath.row];
    
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@  %@", book.year, book.author.fullName];
    
    UIImage *image = [UIImage imageNamed:book.author.lastName];
    cell.imageView.image = image != nil ? image : [UIImage imageNamed:@"NoImage"];
    
    return cell;
}

@end

























