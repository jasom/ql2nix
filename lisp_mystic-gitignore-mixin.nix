
{ buildLispPackage, stdenv, fetchurl, lisp-project_mystic, 
   lisp_mystic, lisp_mystic-file-mixin,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mystic lisp_mystic-file-mixin  ];
      inherit stdenv;
      systemName = "mystic-gitignore-mixin";
      
      sourceProject = "${lisp-project_mystic}";
      patches = [];
      lisp_dependencies = "${lisp_mystic} ${lisp_mystic-file-mixin}";
      name = "lisp_mystic-gitignore-mixin-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
