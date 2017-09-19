
{ buildLispPackage, stdenv, fetchurl, lisp-project_climc, 
   lisp_cl-ppcre, lisp_cl-xmpp-tls, lisp_mcclim,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_cl-xmpp-tls lisp_mcclim  ];
      inherit stdenv;
      systemName = "climc";
      
      sourceProject = "${lisp-project_climc}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_cl-xmpp-tls} ${lisp_mcclim}";
      name = "lisp_climc-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
