
{ buildLispPackage, stdenv, fetchurl, lisp-project_lquery, 
   lisp_array-utils, lisp_form-fiddle, lisp_plump, lisp_clss,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_array-utils lisp_form-fiddle lisp_plump lisp_clss  ];
      inherit stdenv;
      systemName = "lquery";
      
      sourceProject = "${lisp-project_lquery}";
      patches = [];
      lisp_dependencies = "${lisp_array-utils} ${lisp_form-fiddle} ${lisp_plump} ${lisp_clss}";
      name = "lisp_lquery-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
