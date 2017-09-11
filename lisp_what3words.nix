
{ buildLispPackage, stdenv, fetchurl, lisp-project_what3words, 
   lisp_cl-ppcre, lisp_drakma, lisp_jsown,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_drakma lisp_jsown  ];
      inherit stdenv;
      systemName = "what3words";
      
      sourceProject = "${lisp-project_what3words}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_drakma} ${lisp_jsown}";
      name = "lisp_what3words-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
