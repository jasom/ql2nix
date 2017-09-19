
{ buildLispPackage, stdenv, fetchurl, lisp-project_doubly-linked-list, 
   lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "doubly-linked-list";
      
      sourceProject = "${lisp-project_doubly-linked-list}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_doubly-linked-list-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
