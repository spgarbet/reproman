

tg_cell <- function(contents=NA)
{
  if(inherits(contents,"list"))
  {
    structure(contents, class="tg_cell")
  }
  else if(is.na(contents))
  {
    structure(list(), class="tg_cell")
  } 
  else
  {
    print(traceback())
    stop("Improper table cell construction")
  }
}



rows.tg_cell <- function(object)
{
  length(object)
}

cols.tg_cell <- function(object)
{
  if(length(object) >= 1)
  {    
    length(object[[1]])
  }
  else
  {
    0
  }
}

rows <- function(x) 
{
  UseMethod("rows", x)
}

cols <- function(x) 
{
  UseMethod("cols", x)
}

tg_table <- function(rows, cols, embedded=FALSE)
{
  nt <- sapply(1:rows, FUN=function(x) list(sapply(1:cols, FUN=function(x) tg_cell())))
  
  tbl <- structure(tg_cell(nt), class=c("tg_table", "tg_cell") ) 
  
  attr(tbl, "embedded") <- embedded
  
  tbl
}


tg_label <- function(text, units=NA)
{
  structure(tg_cell(list(label=as.character(text), units=as.character(units))), class = c("tg_label", "tg_cell"))
}

tg_header <- function(text, units=NA)
{
  structure(tg_cell(list(label=as.character(text), units=as.character(units))), class = c("tg_header", "tg_label", "tg_cell"))
}

tg_subheader <- function(text, units=NA)
{
  structure(tg_cell(list(label=as.character(text), units=as.character(units))), class = c("tg_subheader", "tg_header", "tg_label", "tg_cell"))
}

tg_quantile <- function(quantiles)
{
  structure(tg_cell(list(q25=quantiles[2], q50=quantiles[3], q75=quantiles[4])), class=c("tg_quantile", "tg_cell"))  
}

tg_estimate <- function(value, low=NA, high=NA, conf.level=0.95)
{
  structure(tg_cell(list(value=value, low=low, high=high, width=width)), class=c("tg_estimate", "tg_cell"))
}

tg_fstat <- function(f, n1, n2, p)
{
  structure(tg_cell(list(f=f, n1=n1, n2=n2, p=p)), class=c("tg_fstat","tg_cell"))
}

tg_fraction <- function(numerator, denominator)
{
  structure(tg_cell(list(numerator=numerator, denominator=denominator)), class=c("tg_fraction","tg_cell"))
}

tg_chi2 <- function(chi2, df, p)
{
  structure(tg_cell(list(chi2=chi2, df=df, p=p)), class=c("tg_chi2", "tg_cell"))
}

tg_studentt <- function(t, df, p)
{
  structure(tg_cell(list(t=t, df=df, p=p)), class=c("tg_studentt", "tg_cell"))
}