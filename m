Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DF1CA0EC0
	for <qemu-rust@archiver.kernel.org>; Mon, 11 Aug 2025 09:06:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ulOTv-00016Y-Gw; Mon, 11 Aug 2025 05:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1ulOTe-00010r-Kg
 for qemu-rust@nongnu.org; Mon, 11 Aug 2025 05:05:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1ulOTY-00058E-Da
 for qemu-rust@nongnu.org; Mon, 11 Aug 2025 05:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754903148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3arEDWiB35lpQ0DrlYmSSp5Av4aGpT358LT4b/TRNI=;
 b=Xayxxzmfg5M+PVuHTrz5g8KpW167yx6ph86OTNsIl553SvebQ5uofWQQlShMDhfwH5+DpV
 fCQUoQ3Y/KmZsBFVxNIeWn3p3f+NoNtApe2xJS0SUA+1Ll16kwS8hKyLwztzSLfzWrEKMo
 +je2WIxLQakaZfqsN7gMHD6y3l6HIGo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-iCrSQKlyPNW6IeVBbJxNXA-1; Mon, 11 Aug 2025 05:05:46 -0400
X-MC-Unique: iCrSQKlyPNW6IeVBbJxNXA-1
X-Mimecast-MFC-AGG-ID: iCrSQKlyPNW6IeVBbJxNXA_1754903146
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e686308729so1078947285a.3
 for <qemu-rust@nongnu.org>; Mon, 11 Aug 2025 02:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754903146; x=1755507946;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B3arEDWiB35lpQ0DrlYmSSp5Av4aGpT358LT4b/TRNI=;
 b=vtrptXdgHbPD9RLn36M97ICmFvgw2U950R0WmMkiKnUkqCwtzufeSiLbTrW01nPJA3
 JVREt5sVTU1dCBjW0tdLXcoZD/u5kyARb10BxFs91iCUWf89uMqQP4+441t0twTB/Gsw
 liI+gzZ3SGI6u4CzHbllAjc1XqgKD0+FhnfC8kRS2q19lnZAuOycNjZWs4WONsvnve0e
 ynJUZ3rz9J/uVxjFugwfAKyVuQlMkCkg+FvT2pO3QJSV4N44ynX4BE9ITMIilF5rBVWh
 34mfr22DeJHkYq4A/6WFx7GT7vqm7Nh2Zp8NYzFHiHd6VEVceLKUYAujgUO2OH2vJXZe
 CO2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/AcYsHVF2xW3XVjex80E2Zvj8MS4Ajyz8emYNRNhi0dlwvaBtZTpE+EMuxfDnRDLqP24+22RmwFk=@nongnu.org
X-Gm-Message-State: AOJu0YwUs6tLGgkunHew0/rNozM7h6ip68yvk2TgVbU3R04n7iG20652
 YKU7Jep+N9NK1b5ZQjspA1l8cmvznjLmyYt7Rc1CNxYF4an6WMFNT2axj+mLjizwgGQzs4dKaE3
 nrGNlm89sB+urxFsBprgQOgFZPHE5jC4Kf17+6uR1Pc/afQnuTsKOY42YbNDv13I=
X-Gm-Gg: ASbGncusxql4tOsaodlogYhHRYR1oAiirHtxyz1cDnARv855lEvvMx6tepCI/UGJ+LO
 MXMoLmABs2rEWOmXjusXWwtdZ9elTEt67iDEDHHHurLgc9tELxrlUQJIqcFVeUsxY4jqKBJsyzi
 VWryHZzRotf6Cy3Y3bkJEVcaxBnQx3D1FDbJb+qtJ1pGzFvOHWD+ql6iM18SbGjc5tt67g83TtP
 flh5e0cMRpMa9UvsDD5D4l4X/qusOPKKf0L7S4nXPui7K7MvnAHSFO8iP82wqa3Gha30/d9uc5u
 Mya/R28x75O8BpBbwxf+nGm9kgr2F/rJKR994CQJxr3D8Jwx
X-Received: by 2002:a05:620a:318d:b0:7e8:468e:67e2 with SMTP id
 af79cd13be357-7e8468e683emr645798085a.26.1754903145944; 
 Mon, 11 Aug 2025 02:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk92ZCDD21ZutEhtpWcEezQQWCmFFkhwugmku+IWht5Jb2b6FD3kY6SVUzGLogPTZoQplGqA==
X-Received: by 2002:a05:620a:318d:b0:7e8:468e:67e2 with SMTP id
 af79cd13be357-7e8468e683emr645794985a.26.1754903145439; 
 Mon, 11 Aug 2025 02:05:45 -0700 (PDT)
Received: from wheatley.localdomain ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1263301985a.80.2025.08.11.02.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 02:05:44 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id B34F8CA636C3; Mon, 11 Aug 2025 11:05:42 +0200 (CEST)
Date: Mon, 11 Aug 2025 11:05:42 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: "Dr. Werner Fink" <werner@suse.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/2] tests/qemu-iotests: Indent expected error messages
Message-ID: <aJmyZjo0ridS7XXz@wheatley.k8r.cz>
References: <cover.1754060086.git.mkletzan@redhat.com>
 <f5be6d407c105fa199d10867f5de48bbd25c008c.1754060086.git.mkletzan@redhat.com>
 <aIzhtcg-TNZE0zH8@redhat.com> <87v7n63lld.fsf@suse.de>
 <aJCaoULvGgKjEL16@redhat.com>
 <aJL8RH8ePPNEteMg@boole.nue2.suse.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fKm/Hv/oX3AK4ps5"
Content-Disposition: inline
In-Reply-To: <aJL8RH8ePPNEteMg@boole.nue2.suse.org>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org


--fKm/Hv/oX3AK4ps5
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 08:54:51AM +0200, Dr. Werner Fink wrote:
>On 2025/08/04 13:33:53 +0200, Kevin Wolf wrote:
>> Am 01.08.2025 um 21:09 hat Fabiano Rosas geschrieben:
>> > Daniel P. Berrang=E9 <berrange@redhat.com> writes:
>> >
>> > > On Fri, Aug 01, 2025 at 04:59:50PM +0200, Martin Kletzander wrote:
>> > >> From: Martin Kletzander <mkletzan@redhat.com>
>> > >>
>> > >> When running all tests the expected "killed" messages are indented
>> > >> differently than the actual ones, by three more spaces.  Change it =
so
>> > >> that the messages match and tests pass.
>> > >
>> > > This would break the tests on my system and CI too.
>> > >
>> > > What distro are you seeing this on ?
>> > >
>> > > I'm guessing this is a different in either valgrind or C library ?
>> >
>> > It's bash, we have an open issue about it:
>> >
>> > https://gitlab.com/qemu-project/qemu/-/issues/3050
>>
>> I see a patch has been posted to that bug, the most important part of
>> which is this added filtering:
>>
>> --- a/tests/qemu-iotests/common.filter
>> +++ b/tests/qemu-iotests/common.filter  2025-07-25 11:39:22.419665788 +0=
000
>> @@ -75,7 +75,7 @@ _filter_qemu_io()
>>      _filter_win32 | \
>>      gsed -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*=
\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX op=
s\/sec)/" \
>>          -e "s/: line [0-9][0-9]*:  *[0-9][0-9]*\( Aborted\| Killed\)/:\=
1/" \
>> -        -e "s/qemu-io> //g"
>> +        -e "s/qemu-io> //g" -e '/Killed/{ s/ \{2,\}/ /}'
>>  }
>>
>>  # replace occurrences of QEMU_PROG with "qemu"
>>
>> This approach makes sense to me, though I would have kept each sed
>> expression on a separate line.
>>
>> And given that the context line above includes "Aborted" as well, maybe
>> have it here, too, though none of the actual test outputs have an
>> Aborted message any more since commit 3f39447. Or we could have a
>> cleanup patch first that removes the unused "Abort" above, just to keep
>> things consistent.
>>
>> Either way, please post this as a proper patch on the mailing list.
>
>Just next try in tha attached patch with a fixed version of
>the sed command.
>
>Werner
>
>--=20
>  "Having a smoking section in a restaurant is like having
>          a peeing section in a swimming pool." -- Edward Burr

>From: Werner Fink <werner@suse.de>
>Date: Fri, 08 Aug 06:41:23 +0000
>Subject: [PATCH 1/1] Avoid dependency on padding on signal messages
>
>New bash 5.3 uses a different padding for reporting job status.
>
>Resolves: boo#1246830

Not sure you meant that or
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3050

>Signed-off-by: Werner Fink <werner@suse.de>

but, FWIW, if that makes any difference,

Tested-by: Martin Kletzander <mkletzan@redhat.com>

>---
> tests/qemu-iotests/039.out       |   10 +++++-----
> tests/qemu-iotests/061.out       |    4 ++--
> tests/qemu-iotests/137.out       |    2 +-
> tests/qemu-iotests/common.filter |    2 +-
> 4 files changed, 9 insertions(+), 9 deletions(-)
>
>--- a/tests/qemu-iotests/039.out
>+++ b/tests/qemu-iotests/039.out	2025-07-25 11:36:51.949026116 +0000
>@@ -11,7 +11,7 @@ No errors were found on the image.
> Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> wrote 512/512 bytes at offset 0
> 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>-./common.rc: Killed                  ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_I=
O}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@=
" )
>+./common.rc: Killed ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_IO}" _qemu_proc_ex=
ec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
> incompatible_features     [0]
> ERROR cluster 5 refcount=3D0 reference=3D1
> ERROR OFLAG_COPIED data cluster: l2_entry=3D8000000000050000 refcount=3D0
>@@ -46,7 +46,7 @@ read 512/512 bytes at offset 0
> Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> wrote 512/512 bytes at offset 0
> 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>-./common.rc: Killed                  ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_I=
O}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@=
" )
>+./common.rc: Killed ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_IO}" _qemu_proc_ex=
ec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
> incompatible_features     [0]
> ERROR cluster 5 refcount=3D0 reference=3D1
> Rebuilding refcount structure
>@@ -60,7 +60,7 @@ incompatible_features     []
> Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> wrote 512/512 bytes at offset 0
> 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>-./common.rc: Killed                  ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_I=
O}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@=
" )
>+./common.rc: Killed ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_IO}" _qemu_proc_ex=
ec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
> incompatible_features     []
> No errors were found on the image.
>=20
>@@ -79,7 +79,7 @@ No errors were found on the image.
> Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> wrote 512/512 bytes at offset 0
> 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>-./common.rc: Killed                  ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_I=
O}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@=
" )
>+./common.rc: Killed ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_IO}" _qemu_proc_ex=
ec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
> incompatible_features     [0]
> ERROR cluster 5 refcount=3D0 reference=3D1
> ERROR OFLAG_COPIED data cluster: l2_entry=3D8000000000050000 refcount=3D0
>@@ -89,7 +89,7 @@ Data may be corrupted, or further writes
> Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
> wrote 512/512 bytes at offset 0
> 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>-./common.rc: Killed                  ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_I=
O}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@=
" )
>+./common.rc: Killed ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_IO}" _qemu_proc_ex=
ec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
> incompatible_features     []
> No errors were found on the image.
> *** done
>--- a/tests/qemu-iotests/061.out
>+++ b/tests/qemu-iotests/061.out	2025-07-25 11:36:51.949026116 +0000
>@@ -118,7 +118,7 @@ No errors were found on the image.
> Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> wrote 131072/131072 bytes at offset 0
> 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>-./common.rc: Killed                  ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_I=
O}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@=
" )
>+./common.rc: Killed ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_IO}" _qemu_proc_ex=
ec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
> magic                     0x514649fb
> version                   3
> backing_file_offset       0x0
>@@ -304,7 +304,7 @@ No errors were found on the image.
> Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> wrote 131072/131072 bytes at offset 0
> 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>-./common.rc: Killed                  ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_I=
O}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@=
" )
>+./common.rc: Killed ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_IO}" _qemu_proc_ex=
ec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
> magic                     0x514649fb
> version                   3
> backing_file_offset       0x0
>--- a/tests/qemu-iotests/137.out
>+++ b/tests/qemu-iotests/137.out	2025-07-25 11:36:51.949026116 +0000
>@@ -35,7 +35,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGF
> qemu-io: Unsupported value 'blubb' for qcow2 option 'overlap-check'. Allo=
wed are any of the following: none, constant, cached, all
> wrote 512/512 bytes at offset 0
> 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>-./common.rc: Killed                  ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_I=
O}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@=
" )
>+./common.rc: Killed ( VALGRIND_QEMU=3D"${VALGRIND_QEMU_IO}" _qemu_proc_ex=
ec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
> OK: Dirty bit not set
> Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> qemu-io: Parameter 'lazy-refcounts' expects 'on' or 'off'
>--- a/tests/qemu-iotests/common.filter
>+++ b/tests/qemu-iotests/common.filter	2025-08-06 06:41:23.649980764 +0000
>@@ -74,7 +74,7 @@ _filter_qemu_io()
> {
>     _filter_win32 | \
>     gsed -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/=
sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\=
/sec)/" \
>-        -e "s/: line [0-9][0-9]*:  *[0-9][0-9]*\( Aborted\| Killed\)/:\1/=
" \
>+        -e "s/: line [0-9][0-9]*:  *[0-9][0-9]*\( Aborted\| Killed\) \{2,=
\}/:\1 /" \
>         -e "s/qemu-io> //g"
> }
>=20




--fKm/Hv/oX3AK4ps5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmiZsmYACgkQCB/CnyQX
ht1Erw/+IVpljNdEiwGO3Kc3jcSEqoslQb2mS6Gv3wJHzWe/qGV3oCuAA1q1fgWg
W1+p1SpFB7ThXRVAIr4ChC2B4clbBSmYOXXdM5QBtL9Q2FzwtUpyffuih8uMLlq0
uYhHWPn7T+7Sna6oedxtm9tEL705H88kVVfPV6bB6SoQIX1fVHVkWpIJDlBkHq+q
Qj2pvI3XiMKwLHgGuH66kixq9t98jbKvoDP2/d64ugPHGnxw5y6Oa3MH+y8ffdwJ
iab/V7DvZ7D07gol25cr0Fw00S+z4sefXddmwT0vPC8AkaPSTWUb4aCa7N9BHn9P
qaIOMnEXJjXb93raZW++shMp3T/jCpwYEurLJceZqAWPgmyWqgc2HJia4C+sYmLx
Z0UoiqXpfBmHMoyOKCOeYBPZxvDHihkx9+7us/bEqCjxmcIhKWiRn+qRkPsXzkOb
k/jRK4eb1pV/iNhCCv/JqpPau/NJmYT+aomiRFIB1ONEYNA9GQM0/t7Q8RTnJHtT
il6AQH0mTvdNodS1OV6XnyKyvTVBw9/W9VGaU3VjB1f0BGWKhWlCOuo5q9eHOgc9
R6xrTpaGdO0KIdyETkm2xsNa3RjIM9F9UzU2+d8ueFQ4OIM8jx9CEuAlhzD0rqvl
y0QSudQlh3HpoPGgUJ64vqKXgtU0BzGr0JmunKKfcToynSct6jo=
=Wc8v
-----END PGP SIGNATURE-----

--fKm/Hv/oX3AK4ps5--


