
{ buildLispPackage, stdenv, fetchurl, lisp-project_flow, 
   lisp_documentation-utils, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_closer-mop  ];
      inherit stdenv;
      systemName = "flow";
      
      sourceProject = "${lisp-project_flow}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_closer-mop}";
      name = "lisp_flow-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
