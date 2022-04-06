"===============================================================================
"===============================================================================
" Включение подсветки синтаксиса
syntax on

" Включение определенич типов файлов
filetype on
filetype plugin on
filetype indent on

" Отключение оповещения морганием и звуком
set novisualbell
set t_vb=

set helplang=en,ru

" Переход на предыдущую/следующую строку
set backspace=indent,eol,start

set whichwrap+=<,>,[,]

" История команд
set history=100

" Максимальное количество изменений, которые могут быть отменены
set undolevels=5000

" Не создавать резервные копии файлов
set nobackup

" Кодировка по умолчанию
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r

set fileformat=unix          " Формат файла по умолчанию
set fileformats=unix,dos,mac

" Не выгружать буфер, при переключении на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз когда переключаешься между ними
set hidden

set autoread            " Включение автоматического перечтения файла при изменении
set autochdir           " Автоматически устанавливать текущей, директорию отрытого файла
set browsedir=buffer    " Начинать обзор с каталога текущего буфера
set confirm             " Включение диалогов с запросами

" Опции авто-дополнения
set completeopt=longest,menuone

" Показывать все возможные кандидаты при авто-завершении команд
set nowildmenu
set wildmode=list:longest,full

" Включение проверки орфографии, для русского и английского
set spelllang=ru_yo,en_us
" "set spell
"
" Раскладка по умолчанию - английская
set iminsert=0

" Не перерисовывать окно при работе макросов
set lazyredraw

"===============================================================================
"===============================================================================

set ruler       " Включение отображения позиции курсора (всё время)

set mouse=a     " Подключение мыши
set mousehide   " Прятать указатель во время набора текста
set cursorline  " Включить подсветку текущей позиции курсора
set mousemodel=popup

set guioptions+=b   " Включение горизонтального скролл-бара
set guioptions-=T   " Убрать toolbar
"set guioptions+=c   " Отключение графических диалогов
""set guioptions-=e   " Замена графических табов, текстовыми

set number          " Включение отображения номеров строк
set shortmess+=I    " Отключение приветственного сообщения
set showtabline=2   " Показывать по умлочанию строку со вкладками
set wildmenu        " Показывать меню в командной строке
                    " для выбора вариантов авто-дополнения
		    " set showmatch       " Довсвечивать совпадающую скобку
		    " set list            " Подсвечивать некоторые символы
		    
set showmatch       " Довсвечивать совпадающую скобку
set list            " Подсвечивать некоторые символы

" Установка символов для подсветки
set list listchars=tab:▹·,trail:·,extends:»,precedes:«,nbsp:×

let g:molokai_original = 1
"==============================================================================

" Включение отображения незавершенных команд в статусной строке
set showcmd

" Всегда отображать статусную строку
set laststatus=2

hi StatusLineBufferNumber guifg=fg guibg=bg gui=bold

" Формат статусной строки
set stl+=\ %#StatusLineBufferNumber#
set stl+=[%n]    " Номер буфера
set stl+=%*\
set stl+=%<
set stl+=%f      " Имя файла загруженного в буфер
set stl+=%*\
set stl+=[%{&ft} " Тип файла, загруженного в буфер, например [cpp]
set stl+=\ \|\
set stl+=%{&fileencoding} " Кодировка файла
set stl+=\ \|\
set stl+=%{&ff}] " Формат файла
set stl+=%=      " Выравнивание по правому краю
set stl+=\
set stl+=Line:
set stl+=\ %l/   " Номер строки
set stl+=%L      " Количество строк в буфере
set stl+=\
set stl+=Col:
set stl+=\ %3v   " Номер колонки
set stl+=\
set stl+=[%P]    " Позиция текста, отображаемого в окне
                 " по отношению к началу файла в процентах
set stl+=%#error#%m%*       " Флаг состояния несохранённых
"                  изменений
set stl+=%#warningmsg#%r%*  " Флаг состояния 'только для
"                  чтения
"
"                  " Показ нескольких типов предупреждений связанных с
"                  некорректной работой с
"                  " отступами:
""[mixed-indenting]" - В случае если в файле для задания
"                  отступов совместно
"                  " используются пробелы и символы табуляции
"                  " "[expandtab-disabled]" - Если опция expandtab отключена,
"                  но в файле для
"                  " задания отступов применяются пробелы
"                  " "[expandtab-enabled]" - Если опция expandtab активна, но
"                  для задания
"                  " отступов используются символы табуляции
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&expandtab)
            let b:statusline_tab_warning = '[expandtab-disabled]'
        elseif (tabs && &expandtab)
            let b:statusline_tab_warning = '[expandtab-enabled]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"===============================================================================
"	Отступы и табуляция
"==============================================================================

set autoindent                          " Наследовать отступы предыдущей строки
set smartindent                         " Включить 'умные' отступы
set expandtab                           " Преобразование таба в пробелы
set shiftwidth=4                        " Размер табуляции по умолчанию
set softtabstop=4
set tabstop=4

"===============================================================================
"	Поиск текста
"===============================================================================

set hlsearch        " Включение подсветки слов при поиске
set incsearch       " Использовать поиск по мере набора

" Использовать регистра-зависимый поиск (для 
" " регистра-независимого использовать \с в конце строки шаблона)
set noignorecase

" " В режиме поиска используется раскладка, заданная по умолчанию
set imsearch=-1

"===============================================================================
"	Плагин TList
"===============================================================================

let g:Tlist_Show_Menu = 1           " Показывать меню (0-выкл/1-вкл)
let g:Tlist_Show_One_File = 1       " Показывать список тегов только из текущего файла
let g:Tlist_Enable_Fold_Column = 0  " Показывать колонку свёртки (folding)

"===============================================================================

" Установить положение окна NERDTree, "left" или "right"
let NERDTreeWinPos = 'left'

let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\~$', '*.pyc', '*.pyo']
let NERDChristmasTree = 0



"
" Список тегов (plugin-taglist)
nmap <F2> <Esc>:TlistToggle<cr>
vmap <F2> <esc>:TlistToggle<cr>
imap <F2> <esc><esc>:TlistToggle<cr>

" Обозреватель файлов (plugin-NERD_Tree)
map <F8> :NERDTreeToggle<cr>
vmap <F8> <esc>:NERDTreeToggle<cr>
imap <F8> <esc>:NERDTreeToggle<cr>


" Полноэкранный режим (plugin-vimshell)
inoremap <F10> <C-o>:Fullscreen<CR>
nnoremap <F10> :Fullscreen<CR>

" Закрыть окно
map <F11> :close<cr>
vmap <F11> <esc>:close<cr>i
imap <F11> <esc>:close<cr>i

" Удалить буфер
map <F12> :bdelete<cr>
vmap <F12> <esc>:bdelete<cr>
imap <F12> <esc>:bdelete<cr>



"===============================================================================
"	Меню
"

" Открытие/закрытие окна NERD_Tree (plugin-NERD_Tree)
menu <silent> Plugin.File\ Explorer<tab><F8> :NERDTreeToggle<cr>
imenu <silent> Plugin.File\ Explorer<tab><F8> <ESC>:NERDTreeToggle<cr>
