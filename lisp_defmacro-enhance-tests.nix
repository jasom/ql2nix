
{ buildLispPackage, stdenv, fetchurl, lisp-project_defmacro-enhance, 
   lisp_defmacro-enhance, lisp_eos,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_defmacro-enhance lisp_eos  ];
      inherit stdenv;
      systemName = "defmacro-enhance/tests";
      
      sourceProject = "${lisp-project_defmacro-enhance}";
      patches = [];
      lisp_dependencies = "${lisp_defmacro-enhance} ${lisp_eos}";
      name = "lisp_defmacro-enhance-tests-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
