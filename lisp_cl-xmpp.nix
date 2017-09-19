
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-xmpp, 
   lisp_ironclad, lisp_cxml, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_cxml lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-xmpp";
      
      sourceProject = "${lisp-project_cl-xmpp}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_cxml} ${lisp_usocket}";
      name = "lisp_cl-xmpp-0.8.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
