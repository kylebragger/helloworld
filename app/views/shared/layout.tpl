<!DOCTYPE html>

<html lang="en">
<head>
    <?php include APPPATH . 'app/views/shared/_head.tpl'; ?>
</head>
<body>
<?php if (false !== ($flash = Session::flash('notice'))): ?>
<div id="flash" class="notice-bar">
    <?php echo $flash; ?>
    <a href="" class="close">&times; Close</a>
</div>
<?php endif; ?>

<div id="header">
    <div class="container_12 inner">
        <a href="/" rel="home" id="logo"><strong>Forrst</strong></a>
        <ul id="user-nav">
            <?php if (User::$current): ?>
            <li><a class="new-post" href="/posts/new">+ New Post</a></li>
            <li>Hi, <a href="<?php echo User::$current->profile_url; ?>"><?php echo h(User::$current->username); ?></a></li>
            <li><a<?php if (false) echo ' class="current"'; ?> href="/invites" title="You have <?php echo User::$current->available_invites; ?> left">Invite Friends</a></li>
            <li id="n-settings"><a<?php if ($this->controller->current_user_nav == 'settings') echo ' class="current"'; ?> href="/settings">Settings</a></li>
            <li><a href="<?php echo User::$current->signout_url; ?>">Log out</a></li>
            <?php else: ?>
            <li><a href="/login">Log in</a></li>
            <?php endif; ?>
        </ul>
    </div>
</div>
<div id="nav">
    <div class="container_12 inner">
        <ul id="tabs">
            <?php if (User::$current): ?>
            <li class="tab<?php if ($this->controller->current_tab == 'activity') echo ' current'; ?>" id="nav-activity"><a href="/activity/from/friends">Activity &#9662;</a>
                <ul class="subnav">
                    <li><a href="/activity/from/friends">From&nbsp;Friends</a></li>
                    <li><a href="/activity/incoming">Incoming</a></li>
                </ul>
            </li>
            <li class="no-op tab<?php if ($this->controller->current_tab == 'posts') echo ' current'; ?>" id="nav-posts"><a href="javascript:void(0)">Posts &#9662;</a>
                <ul class="subnav">
                    <li><a href="/questions">Questions</a></li>
                    <li><a href="/snaps">Snaps</a></li>
                    <li><a href="/code">Code</a></li>
                    <li><a href="/links">Links</a></li>
                    <li class="sep"><a href="/posts/new">+&nbsp;New&nbsp;Post</a></li>
                </ul>
            </li>
            <li class="no-op tab<?php if ($this->controller->current_tab == 'people') echo ' current'; ?>" id="nav-people"><a href="javascript:void(0)">People &#9662;</a>
                <ul class="subnav">
                    <li><a href="/people/list/developers">Developers</a></li>
                    <li><a href="/people/list/designers">Designers</a></li>
                    <li><a href="/people/list/recent">Newest</a></li>
                    <li><a href="/people/<?php echo h(User::$current->username); ?>/following">Your&nbsp;Friends</a></li>
                    <li><a href="/people/<?php echo h(User::$current->username); ?>/followers">Your&nbsp;Followers</a></li>
                    <li><a href="/people/invite">Invite&nbsp;New&nbsp;Members</a></li>
                </ul>
            </li>
            <li class="tab<?php if ($this->controller->current_tab == 'tags') echo ' current'; ?>" id="nav-tags"><a href="/tags">Tags &#9662;</a>
                <ul class="subnav">
                    <li><a href="/tags">Tags&nbsp;A&nbsp;to&nbsp;Z</a></li>
                    <?php if (false): ?><li><a href="#">Posts&nbsp;tagged&nbsp;x</a></li><?php endif; ?>
                </ul>
            </li>
            <li class="tab<?php if ($this->controller->current_tab == 'you') echo ' current'; ?>" id="nav-you"><a href="<?php echo User::$current->profile_url; ?>">You &#9662;</a>
                <ul class="subnav">
                    <li><a href="<?php echo User::$current->profile_url; ?>">Your&nbsp;Profile</a></li>
                    <li><a href="<?php echo User::$current->profile_url; ?>/posts">Posts</a></li>
                    <li><a href="<?php echo User::$current->profile_url; ?>/comments">Comments</a></li>
                    <li><a href="<?php echo User::$current->profile_url; ?>/likes">Likes</a></li>
                    <li><a href="<?php echo User::$current->profile_url; ?>/bookmarks">Bookmarks</a></li>
                </ul>
            </li>
            <?php if (User::$current->is_admin()): ?>
            <li class="no-op tab"><a href="javascript:void(0)">Admin &#9662;</a>
                <ul class="subnav">
                    <li><a href="/admin/flags/posts">Flagged&nbsp;posts</a></li>
                    <li><a href="/admin/flags/comments">Flagged&nbsp;comments</a></li>
                </ul>
            </li>
            <?php endif; ?>
            
            <?php else: ?>
                
                <?php foreach (Post::$post_types as $type): ?>
                <?php $plural = Inflector::pluralize($type); ?>
                <li class="tab<?php if ($this->controller->current_tab == $plural) echo ' current'; ?>" id="nav-guest-<?php echo $plural; ?>"><a href="/<?php echo $plural; ?>"><?php echo ucfirst($plural); ?> &#9662;</a>
                    <ul class="subnav">
                        <li><a href="/<?php echo $plural; ?>?sort=popular">Popular</a></li>
                        <li><a href="/<?php echo $plural; ?>">Recent</a></li>
                        <li><a href="/<?php echo $plural; ?>?sort=best">Staff&nbsp;Picks</a></li>
                    </ul>
                </li>    
                <?php endforeach; ?>
                
            <?php endif; ?>
        </ul>
    </div>
</div>
<div id="content">
    <div class="container_12">
        
        <?php echo $yield; ?>
        
    </div>
</div>
<div id="footer">
    <?php include APPPATH . 'app/views/shared/_footer.tpl'; ?>
</div>

<?php include APPPATH . 'app/views/shared/_js.tpl'; ?>

<div id="back-to-top" style="display:none;">
    <a href="">&#9650;</a>
</div>

</body>
</html>