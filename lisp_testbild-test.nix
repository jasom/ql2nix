
{ buildLispPackage, stdenv, fetchurl, lisp-project_testbild, 
   lisp_alexandria, lisp_cl-heredoc, lisp_testbild, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-heredoc lisp_testbild lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "testbild-test";
      
      sourceProject = "${lisp-project_testbild}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-heredoc} ${lisp_testbild} ${lisp_trivial-gray-streams}";
      name = "lisp_testbild-test-20101207-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
