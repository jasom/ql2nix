
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-protobufs, 
   lisp_babel, lisp_closer-mop, lisp_trivial-garbage,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_closer-mop lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "cl-protobufs";
      
      sourceProject = "${lisp-project_cl-protobufs}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_closer-mop} ${lisp_trivial-garbage}";
      name = "lisp_cl-protobufs-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
