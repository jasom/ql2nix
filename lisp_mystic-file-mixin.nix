
{ buildLispPackage, stdenv, fetchurl, lisp-project_mystic, 
   lisp_mystic,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mystic  ];
      inherit stdenv;
      systemName = "mystic-file-mixin";
      
      sourceProject = "${lisp-project_mystic}";
      patches = [];
      lisp_dependencies = "${lisp_mystic}";
      name = "lisp_mystic-file-mixin-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
