// TypeScript test file
// Comment at the top

/**
 * Documentation comment for a function
 * @param name - The name parameter
 * @returns A greeting string
 */
function greet(name: string): string {
  // Comment inside function
  const greeting = `Hello, ${name}!`;
  return greeting;
}

// Interface definition
interface User {
  id: number;
  name: string;
  email: string;
}

// Class with comments
class UserManager {
  private users: User[] = [];

  /**
   * Add a user to the list
   */
  addUser(user: User): void {
    // Comment before operation
    this.users.push(user);
  }

  // Get all users
  getUsers(): User[] {
    return this.users;
  }
}

// Type alias
type ID = string | number;

// Enum
enum Status {
  Active,
  Inactive,
  Pending
}

// Export statement
export { greet, User, UserManager };
