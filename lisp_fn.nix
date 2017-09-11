
{ buildLispPackage, stdenv, fetchurl, lisp-project_fn, 
   lisp_macroexpand-dammit, lisp_named-readtables,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_macroexpand-dammit lisp_named-readtables  ];
      inherit stdenv;
      systemName = "fn";
      
      sourceProject = "${lisp-project_fn}";
      patches = [];
      lisp_dependencies = "${lisp_macroexpand-dammit} ${lisp_named-readtables}";
      name = "lisp_fn-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
