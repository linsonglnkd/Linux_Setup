# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
function pushdir {
  typeset dirname sDirstack nDir
  dirname=$PWD
  sDirstack=$MYDIRSTACK
  nDir=0
  if [[ $MYDIRSTACK = +(*$dirname *) ]]
  then
    echo $dirname already in stack
    return 0
  fi
  while [[ -n $sDirstack ]]; do
    (( nDir+=1 ))
    sDirstack=${sDirstack#* }
  done
  if [[ $nDir -ge 7 ]]; then
    echo too many directories in the stack
    return 0
  fi
  MYDIRSTACK="$PWD $MYDIRSTACK"
}

function movedir {
  typeset dirname sDirstack nCount
  if [[ -z $MYDIRSTACK ]]; then
    echo no directories in the stack
    return 0
  fi

  PS3="select the directory:"
  select dirname in $MYDIRSTACK; do
    if [[ -n $dirname ]]; then
      echo $dirname
      break
    else
      echo "invalid selection ... pick again"
    fi
  done

  if [[ -d $dirname && -x $dirname ]]; then
    cd $dirname
  else
    echo invalid directory
  fi
}

alias rm='rm -i'
alias ps='ps -o pid,stime,args'
alias ll='ls -tl | head -20'
alias grep='grep -i'

PS1="\${PWD#\${PWD%/*/*}/}> "
set -o vi
TZ='America/Los_Angeles'; export TZ

PATH=$PATH:$HOME/bin
export PATH

# LinkedIn Specific
export PYMH=/export/home/solin/work/2013Q1/PYMH
export bizops4=esv4-bizops04.linkedin.biz
export magic=eat1-magicgw01.grid.linkedin.com
