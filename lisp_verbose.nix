
{ buildLispPackage, stdenv, fetchurl, lisp-project_verbose, 
   lisp_piping, lisp_local-time, lisp_dissect, lisp_documentation-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_piping lisp_local-time lisp_dissect lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "verbose";
      
      sourceProject = "${lisp-project_verbose}";
      patches = [];
      lisp_dependencies = "${lisp_piping} ${lisp_local-time} ${lisp_dissect} ${lisp_documentation-utils}";
      name = "lisp_verbose-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
