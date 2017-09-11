
{ buildLispPackage, stdenv, fetchurl, lisp-project_chrome-native-messaging, 
   lisp_trivial-utf-8,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "chrome-native-messaging";
      
      sourceProject = "${lisp-project_chrome-native-messaging}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8}";
      name = "lisp_chrome-native-messaging-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
