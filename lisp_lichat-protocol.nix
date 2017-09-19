
{ buildLispPackage, stdenv, fetchurl, lisp-project_lichat-protocol, 
   lisp_cl-unicode, lisp_closer-mop, lisp_documentation-utils,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-unicode lisp_closer-mop lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "lichat-protocol";
      
      sourceProject = "${lisp-project_lichat-protocol}";
      patches = [];
      lisp_dependencies = "${lisp_cl-unicode} ${lisp_closer-mop} ${lisp_documentation-utils}";
      name = "lisp_lichat-protocol-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
