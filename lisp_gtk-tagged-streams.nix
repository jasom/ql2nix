
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-tagged-streams, 
   lisp_cl-cffi-gtk, lisp_trivial-gray-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cffi-gtk lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "gtk-tagged-streams";
      
      sourceProject = "${lisp-project_gtk-tagged-streams}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cffi-gtk} ${lisp_trivial-gray-streams}";
      name = "lisp_gtk-tagged-streams-quicklisp-d1c2b827-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
