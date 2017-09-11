
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_babel, lisp_cl-ppcre, lisp_form-fiddle, lisp_lambda-fiddle, lisp_maiden-client-entities, lisp_maiden-networking,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-ppcre lisp_form-fiddle lisp_lambda-fiddle lisp_maiden-client-entities lisp_maiden-networking  ];
      inherit stdenv;
      systemName = "maiden-irc";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-ppcre} ${lisp_form-fiddle} ${lisp_lambda-fiddle} ${lisp_maiden-client-entities} ${lisp_maiden-networking}";
      name = "lisp_maiden-irc-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
