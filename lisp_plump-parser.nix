
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump, 
   lisp_array-utils, lisp_trivial-indent,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_array-utils lisp_trivial-indent  ];
      inherit stdenv;
      systemName = "plump-parser";
      
      sourceProject = "${lisp-project_plump}";
      patches = [];
      lisp_dependencies = "${lisp_array-utils} ${lisp_trivial-indent}";
      name = "lisp_plump-parser-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
