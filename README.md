#vundle\_config.vim

[Vundle.vim](https://github.com/gmarik/Vundle.vim)的增强插件，方便管理日益增多的插件及其配置。


##使用方法

新建一个*~/.vim/plugins.vim*,从vimrc将vundle的插件列表提取出来。内容类似下面这样:

```
    set nocompatible

    filetype off

    call vundle#begin()


    Plugin 'gmarik/Vundle.vim'
    Plugin 'jiazhoulvke/vundle_config.vim'
    Plugin 'Shougo/neomru.vim'
    Plugin 'Shougo/unite-outline'
    Plugin 'Shougo/unite.vim'
    Plugin 'Shougo/vimshell.vim'
    Plugin 'scrooloose/nerdtree'

    " 载入本地插件列表文件
    if filereadable($VIM_CFG_PATH.'/plugins.local.vim')
        source $VIM_CFG_PATH/plugins.local.vim
    endif

    call vundle#end()
```

在vimrc中加入下面的内容:

```
    " 载入插件列表文件
    if filereadable('~/.vim/plugins.vim')
        source ~/.vim/plugins.vim
    endif
```

保存并重新启动vim，进入*~/.vim/plugins.vim*，移动光标到你需要配置的插件上，比如`Plugin 'jiazhoulvke/vundle_config.vim'`，按`<C-]>`，会自动打开*~/.vim/plugins.config.vim*,查找有没有类似下面的内容:

> " Name: vundle\_config.vim
> "===========================

如果存在的话光标会自动跳转到所在行，如果不存在的话会新建。然后你就可以在后面写上插件的相关配置了，写完以后按`<C-o>`又可以跳转回*~/.vim/plugins.vim*。比把所有的配置全部保存在vimrc中简洁得多。

具体示例可以参考我的[vim配置](https://github.com/jiazhoulvke/myvim)。
