
{ buildLispPackage, stdenv, fetchurl, lisp-project_com-clearly-useful-generic-collection-interface, 
   lisp_com-clearly-useful-generic-collection-interface,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-clearly-useful-generic-collection-interface  ];
      inherit stdenv;
      systemName = "com.clearly-useful.generic-collection-interface.test";
      
      sourceProject = "${lisp-project_com-clearly-useful-generic-collection-interface}";
      patches = [];
      lisp_dependencies = "${lisp_com-clearly-useful-generic-collection-interface}";
      name = "lisp_com-clearly-useful-generic-collection-interface-test-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
