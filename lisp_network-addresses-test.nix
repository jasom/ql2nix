
{ buildLispPackage, stdenv, fetchurl, lisp-project_network-addresses, 
   lisp_fiveam, lisp_network-addresses,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_network-addresses  ];
      inherit stdenv;
      systemName = "network-addresses-test";
      
      sourceProject = "${lisp-project_network-addresses}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_network-addresses}";
      name = "lisp_network-addresses-test-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
