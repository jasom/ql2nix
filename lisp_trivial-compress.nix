
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-compress, 
   lisp_which, lisp_zip, lisp_archive,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_which lisp_zip lisp_archive  ];
      inherit stdenv;
      systemName = "trivial-compress";
      
      sourceProject = "${lisp-project_trivial-compress}";
      patches = [];
      lisp_dependencies = "${lisp_which} ${lisp_zip} ${lisp_archive}";
      name = "lisp_trivial-compress-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
