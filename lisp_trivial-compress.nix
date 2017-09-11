
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-compress, 
   lisp_alexandria, lisp_archive, lisp_which, lisp_zip,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_archive lisp_which lisp_zip  ];
      inherit stdenv;
      systemName = "trivial-compress";
      
      sourceProject = "${lisp-project_trivial-compress}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_archive} ${lisp_which} ${lisp_zip}";
      name = "lisp_trivial-compress-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
