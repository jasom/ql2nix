
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-messagepack-rpc, 
   lisp_cl-async, lisp_cl-messagepack,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-async lisp_cl-messagepack  ];
      inherit stdenv;
      systemName = "cl-messagepack-rpc";
      
      sourceProject = "${lisp-project_cl-messagepack-rpc}";
      patches = [];
      lisp_dependencies = "${lisp_cl-async} ${lisp_cl-messagepack}";
      name = "lisp_cl-messagepack-rpc-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
