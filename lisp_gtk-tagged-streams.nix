
{ buildLispPackage, stdenv, fetchurl, lisp-project_gtk-tagged-streams, 
   lisp_trivial-gray-streams, lisp_cl-cffi-gtk,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams lisp_cl-cffi-gtk  ];
      inherit stdenv;
      systemName = "gtk-tagged-streams";
      
      sourceProject = "${lisp-project_gtk-tagged-streams}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams} ${lisp_cl-cffi-gtk}";
      name = "lisp_gtk-tagged-streams-quicklisp-d1c2b827-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
