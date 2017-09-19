
{ buildLispPackage, stdenv, fetchurl, lisp-project_xhtmlgen, 
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
      systemName = "xhtmlgen";
      
      sourceProject = "${lisp-project_xhtmlgen}";
      patches = [];
      lisp_dependencies = "${lisp_cxml}";
      name = "lisp_xhtmlgen-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
