
{ buildLispPackage, stdenv, fetchurl, lisp-project_bknr-datastore, 
   lisp_cxml, lisp_cl-interpol,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml lisp_cl-interpol  ];
      inherit stdenv;
      systemName = "bknr.xml";
      
      sourceProject = "${lisp-project_bknr-datastore}";
      patches = [];
      lisp_dependencies = "${lisp_cxml} ${lisp_cl-interpol}";
      name = "lisp_bknr-xml-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
