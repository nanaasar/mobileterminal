//
//  Settings.m
//  Terminal

#import "Settings.h"
#import "Constants.h"

//_______________________________________________________________________________
//_______________________________________________________________________________

@implementation TerminalConfig

//_______________________________________________________________________________

- (id)init
{
  self = [super init];
	
  width = 45;
  height = 17;
	fontSize = 12;
  font = @"CourierNewBold";
  args = nil;
	
  return self;
}

//_______________________________________________________________________________

- (NSString*)fontDescription
{
	return [NSString stringWithFormat:@"%@ %d", font, fontSize];
}

//_______________________________________________________________________________

- (NSString*) font { return font; }
- (void) setFont: (NSString*)str
{
	if (font != str)
	{
		[font release];
		font = [str copy];
	}
}

//_______________________________________________________________________________

- (NSString*) args { return args; }
- (void) setArgs: (NSString*)str
{
	if (args != str)
	{
		[args release];
		args = [str copy];
	}
}

//_______________________________________________________________________________

@synthesize width;
@synthesize height;
@synthesize fontSize;
@dynamic font;
@dynamic args;

@end

//_______________________________________________________________________________
//_______________________________________________________________________________


@implementation Settings

//_______________________________________________________________________________

+ (Settings*) sharedInstance
{
  static Settings * instance = nil;
  if (instance == nil) {
    instance = [[Settings alloc] init];
  }
  return instance;
}

//_______________________________________________________________________________

- (id)init
{
  self = [super init];

	terminalConfigs = [NSArray arrayWithObjects:
										 [[TerminalConfig alloc] init],
										 [[TerminalConfig alloc] init],
										 [[TerminalConfig alloc] init],
										 [[TerminalConfig alloc] init], nil];
	
	gestureViewColor = colorWithRGBA(1.0f, 1.0f, 1.0f, 0.01f);
	multipleTerminals = YES;
	
  return self;
}

//_______________________________________________________________________________

@synthesize gestureViewColor;
@synthesize multipleTerminals;

-(NSArray *) terminalConfigs { return terminalConfigs; }

//_______________________________________________________________________________

- (NSString*) arguments { return arguments; }
- (void) setArguments: (NSString*)str
{
	if (arguments != str)
	{
		[arguments release];
		arguments = [str copy];
	}
}

@end
