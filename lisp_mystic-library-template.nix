
{ buildLispPackage, stdenv, fetchurl, lisp-project_mystic, 
   lisp_mystic, lisp_mystic-fiveam-mixin, lisp_mystic-gitignore-mixin, lisp_mystic-readme-mixin, lisp_mystic-travis-mixin,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mystic lisp_mystic-fiveam-mixin lisp_mystic-gitignore-mixin lisp_mystic-readme-mixin lisp_mystic-travis-mixin  ];
      inherit stdenv;
      systemName = "mystic-library-template";
      
      sourceProject = "${lisp-project_mystic}";
      patches = [];
      lisp_dependencies = "${lisp_mystic} ${lisp_mystic-fiveam-mixin} ${lisp_mystic-gitignore-mixin} ${lisp_mystic-readme-mixin} ${lisp_mystic-travis-mixin}";
      name = "lisp_mystic-library-template-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
