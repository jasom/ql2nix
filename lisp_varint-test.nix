
{ buildLispPackage, stdenv, fetchurl, lisp-project_protobuf, 
   lisp_hu-dwim-stefil, lisp_varint,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil lisp_varint  ];
      inherit stdenv;
      systemName = "varint-test";
      
      sourceProject = "${lisp-project_protobuf}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil} ${lisp_varint}";
      name = "lisp_varint-test-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
