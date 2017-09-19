
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump, 
   lisp_trivial-indent, lisp_array-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-indent lisp_array-utils  ];
      inherit stdenv;
      systemName = "plump";
      
      sourceProject = "${lisp-project_plump}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-indent} ${lisp_array-utils}";
      name = "lisp_plump-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
