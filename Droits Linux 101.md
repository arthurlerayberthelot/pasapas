Here’s a quick reminder of how permissions work in a Linux system :

***

<b>There are three standard permissions</b>  for files, directories, and other objects : 

- Read or <b>R</b>, 

- Write or <b>W</b>,

- Execute or <b>X</b>.

***

All objects are associated with : 

- a user account (either a user or system account),

- a group of accounts.

***

We define the permissions for objects for :

- the owner or <b>u</b>.

- the owning group or <b>g</b>.

- everyone else or <b>o</b>.

***

For example, to grant all permissions (rwx) to the owner (u) of an object, we use the command :

````chmod u=rwx /our/file````

***

But there’s a simpler way. Each type of permission has its numeric equivalent :

- <b>R is 4.</b>

- <b>W is 2.</b>

- <b>X is 1.</b>

So, if we want to give read-only permission, the numerical value will be 4. If we also want to give execute permission, we just have to add the two values, making the final numerical value 5 (4+1).

***

Let’s say we want to do the same as before but simpler. We want to give full access to the owner (u) and no permissions to group (g) and other (o) :

````chmod 700 /our/file````

The "7" corresponds to (u). It means : 4 + 2 + 1 or R + W + X. Here, we’ve granted all permissions to (u). The two 0’s are for (g) and (o) : no permissions are granted to them.

***

To change the owner and/or owning group of an object, we use the command :

````chown "user:group" /our/file````

***

It’s always useful to check the permissions applied to a resource with a quick ````ls -l```` in the desired directory.

***

In a future post, I will cover the special permissions : ````SetUID```` and the infamous ````Sticky Bit````.
