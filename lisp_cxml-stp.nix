
{ buildLispPackage, stdenv, fetchurl, lisp-project_cxml-stp, 
   lisp_xpath, lisp_cxml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_xpath lisp_cxml  ];
      inherit stdenv;
      systemName = "cxml-stp";
      
      sourceProject = "${lisp-project_cxml-stp}";
      patches = [];
      lisp_dependencies = "${lisp_xpath} ${lisp_cxml}";
      name = "lisp_cxml-stp-20120520-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
