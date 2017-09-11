
{ buildLispPackage, stdenv, fetchurl, lisp-project_com-clearly-useful-iterate-plus, 
   lisp_com-clearly-useful-generic-collection-interface, lisp_com-clearly-useful-iterator-protocol, lisp_com-clearly-useful-protocols, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-clearly-useful-generic-collection-interface lisp_com-clearly-useful-iterator-protocol lisp_com-clearly-useful-protocols lisp_iterate  ];
      inherit stdenv;
      systemName = "com.clearly-useful.iterate+";
      
      sourceProject = "${lisp-project_com-clearly-useful-iterate-plus}";
      patches = [];
      lisp_dependencies = "${lisp_com-clearly-useful-generic-collection-interface} ${lisp_com-clearly-useful-iterator-protocol} ${lisp_com-clearly-useful-protocols} ${lisp_iterate}";
      name = "lisp_com-clearly-useful-iterate--20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
