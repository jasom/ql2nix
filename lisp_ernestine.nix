
{ buildLispPackage, stdenv, fetchurl, lisp-project_ernestine, 
   lisp_drakma, lisp_cl-ppcre, lisp_cl-prevalence, lisp_split-sequence,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_cl-ppcre lisp_cl-prevalence lisp_split-sequence  ];
      inherit stdenv;
      systemName = "ernestine";
      
      sourceProject = "${lisp-project_ernestine}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_cl-ppcre} ${lisp_cl-prevalence} ${lisp_split-sequence}";
      name = "lisp_ernestine-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
