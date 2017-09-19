
{ buildLispPackage, stdenv, fetchurl, lisp-project_lquery, 
   lisp_clss, lisp_plump, lisp_form-fiddle, lisp_array-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clss lisp_plump lisp_form-fiddle lisp_array-utils  ];
      inherit stdenv;
      systemName = "lquery";
      
      sourceProject = "${lisp-project_lquery}";
      patches = [];
      lisp_dependencies = "${lisp_clss} ${lisp_plump} ${lisp_form-fiddle} ${lisp_array-utils}";
      name = "lisp_lquery-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
