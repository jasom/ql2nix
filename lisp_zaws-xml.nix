
{ buildLispPackage, stdenv, fetchurl, lisp-project_zaws, 
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
      systemName = "zaws-xml";
      
      sourceProject = "${lisp-project_zaws}";
      patches = [];
      lisp_dependencies = "${lisp_cxml}";
      name = "lisp_zaws-xml-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
