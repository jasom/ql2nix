
{ buildLispPackage, stdenv, fetchurl, lisp-project_fs-watcher, 
   lisp_alexandria, lisp_com-gigamonkeys-pathnames,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_com-gigamonkeys-pathnames  ];
      inherit stdenv;
      systemName = "fs-watcher";
      
      sourceProject = "${lisp-project_fs-watcher}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_com-gigamonkeys-pathnames}";
      name = "lisp_fs-watcher-20130813-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
