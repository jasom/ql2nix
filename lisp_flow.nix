
{ buildLispPackage, stdenv, fetchurl, lisp-project_flow, 
   lisp_closer-mop, lisp_documentation-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "flow";
      
      sourceProject = "${lisp-project_flow}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_documentation-utils}";
      name = "lisp_flow-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
