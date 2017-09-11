
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-protobufs, 
   lisp_cl-protobufs,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-protobufs  ];
      inherit stdenv;
      systemName = "cl-protobufs-tests";
      
      sourceProject = "${lisp-project_cl-protobufs}";
      patches = [];
      lisp_dependencies = "${lisp_cl-protobufs}";
      name = "lisp_cl-protobufs-tests-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
