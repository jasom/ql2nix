
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchentools, 
   lisp_alexandria, lisp_cl-ppcre, lisp_hunchentoot, lisp_ironclad,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ppcre lisp_hunchentoot lisp_ironclad  ];
      inherit stdenv;
      systemName = "hunchentools";
      
      sourceProject = "${lisp-project_hunchentools}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ppcre} ${lisp_hunchentoot} ${lisp_ironclad}";
      name = "lisp_hunchentools-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
