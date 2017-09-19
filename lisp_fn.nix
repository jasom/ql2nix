
{ buildLispPackage, stdenv, fetchurl, lisp-project_fn, 
   lisp_named-readtables, lisp_macroexpand-dammit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_macroexpand-dammit  ];
      inherit stdenv;
      systemName = "fn";
      
      sourceProject = "${lisp-project_fn}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_macroexpand-dammit}";
      name = "lisp_fn-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
