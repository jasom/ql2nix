
{ buildLispPackage, stdenv, fetchurl, lisp-project_atdoc, 
   lisp_closer-mop, lisp_xuriella, lisp_swank, lisp_split-sequence, lisp_cxml,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_xuriella lisp_swank lisp_split-sequence lisp_cxml  ];
      inherit stdenv;
      systemName = "atdoc";
      
      sourceProject = "${lisp-project_atdoc}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_xuriella} ${lisp_swank} ${lisp_split-sequence} ${lisp_cxml}";
      name = "lisp_atdoc-20120305-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
