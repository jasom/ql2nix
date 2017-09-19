
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rdfxml, 
   lisp_cxml,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml  ];
      inherit stdenv;
      systemName = "cl-rdfxml";
      
      sourceProject = "${lisp-project_cl-rdfxml}";
      patches = [];
      lisp_dependencies = "${lisp_cxml}";
      name = "lisp_cl-rdfxml-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
