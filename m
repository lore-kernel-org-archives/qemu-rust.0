Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25822EDA68F
	for <qemu-rust@archiver.kernel.org>; Tue,  3 Mar 2026 15:56:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vxS6E-0006br-8m; Tue, 03 Mar 2026 10:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vxS6B-0006bM-Mh
 for qemu-rust@nongnu.org; Tue, 03 Mar 2026 10:55:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vxS68-00083p-IN
 for qemu-rust@nongnu.org; Tue, 03 Mar 2026 10:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772553347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBFMAMBF9+GbAURLNU5FTNb7far72NAR6lMU69HXP9c=;
 b=KCR3o2h4UF6/5K6P5ywF0Wsmgl1TTI11Tp2t2yLIl9DJITP3qYLdW8vIebMlD1pERKizvi
 6cB//JrHXW2fpL+G9HqEX+ACYWFd7KZ+cZJAyB0YjtmsfeKjAbT5Gcm33hBhyfBL34x7Pv
 ex6FN6ANgz9ltyW/FagglcLKtE65MFo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-jvZLgCFDNdmPK1-gL2_yZQ-1; Tue, 03 Mar 2026 10:55:46 -0500
X-MC-Unique: jvZLgCFDNdmPK1-gL2_yZQ-1
X-Mimecast-MFC-AGG-ID: jvZLgCFDNdmPK1-gL2_yZQ_1772553345
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-483a2db68caso48996675e9.0
 for <qemu-rust@nongnu.org>; Tue, 03 Mar 2026 07:55:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772553345; x=1773158145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kBFMAMBF9+GbAURLNU5FTNb7far72NAR6lMU69HXP9c=;
 b=jImd24WNHf41d2GdvHs5is0ZsFXUFFTmrxxVrSqAerce5QrfSPCrkxOp5sDfbX697i
 +wGTzfqyQ7xAGk3QZGkw/RhDcNTaQLFEn9vVBFGDEu6YdnBTh4CGmkJppeb+slXf56UL
 Z7ITqK1no7rNrg+HQHIiQIrEpi9vJNNzMfcP93327wrQ9hyrSgaAIf/uhxcorq2SH7Dd
 1QGRL0A4N65ZMvWrcvgSpQ8cBh1rn2eWi1mwCoobyMtIB2ZdNhY67Ra/gDyxhCvP1Bdz
 esfDSuSs9Hw9gCJtXsZ4RM3c8Z5XGx4jtR18E9MswswjP7rgENly4MzDgVzXnCGZDskG
 EZCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF4hJ4Cipl3jIjWwMwTHHxYtEhWIGXhhUCTWohTqHnZFoKZl3ZhGawxREZiSeVNbreLnCccWITBKk=@nongnu.org
X-Gm-Message-State: AOJu0Yypft8B5NWHnG9zDwLugs7zG2DvmhfhbPYtH6Kh9+LV3u0sqVO1
 n7RV17l9kySQ0IQBCPf2YEOcqsBfmZaiXZyhpCnr8aKLP4m4k5d9Gfxu6Q0tT5DZczX2QgwfYfS
 fsQTJZhC9rfS+lzgvB0cfcQC2MPEddkMXIBCgZgm5pQqVuWCTZ3Y0xayN8adflrkxkmwtKL67Th
 Bes+Jz0t/vGClqIJQxK2HNEU5rcdSTew==
X-Gm-Gg: ATEYQzwBTpHIf2ZLRMrMbEaltPVm/PvMw/ECr1hKbeINDPe2Fs3aAhWPQF3yMPcjnl2
 UQq83HYGikHUtHn9L/opj4ZJ9A+vuCwm5gnEjRtxZY44nN71lH8MvD2nD9oxh+BUduqDwNY0J3W
 BD8HHKj3h3vMI+FsNn6uE2p388uKlm0Zi1bU8Ybluq3ucSHtVQI2n8zrVmD3fTyLqKT13HfmvSi
 IzdsAZ0DniyGANXlIM5mcbC+J5pvd+3vJNXBgIljx6B4iYnKuoAn9JpL5AM01hrTfzgMjf4iTh7
 9sRStVw=
X-Received: by 2002:a05:600c:1f06:b0:483:7783:5382 with SMTP id
 5b1f17b1804b1-483c9bf49afmr271617365e9.27.1772553344673; 
 Tue, 03 Mar 2026 07:55:44 -0800 (PST)
X-Received: by 2002:a05:600c:1f06:b0:483:7783:5382 with SMTP id
 5b1f17b1804b1-483c9bf49afmr271616805e9.27.1772553344152; Tue, 03 Mar 2026
 07:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-13-pbonzini@redhat.com>
 <87jyw0khu2.fsf@pond.sub.org>
 <3cd5ac78-1833-4671-a866-60a57f29c3c1@redhat.com>
 <87v7fdm6w6.fsf@pond.sub.org>
In-Reply-To: <87v7fdm6w6.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 3 Mar 2026 16:55:30 +0100
X-Gm-Features: AaiRm527eRsJkf5mhTMOAT03XGTTnkhduTVxyjQG7WtF5hnH1AJrEbUaHd32fjk
Message-ID: <CABgObfYBVbpLfzFiYaCjzTL5zTqynWcUepV=o-AesJJF3jENEQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] scripts/qapi: generate high-level Rust bindings
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qNxJHoMP8JlVnMhxa1uJM4FeHQOzQu7ztu95mL8mh0Q_1772553345
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.322, RCVD_IN_VALIDITY_SAFE_BLOCKED=1.141,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Mar 3, 2026 at 1:31=E2=80=AFPM Markus Armbruster <armbru@redhat.com=
> wrote:

> >> You replied "In this case it doesn't really matter: public items (such
> >> as QAPI enum entries, or struct fields) do not raise the unused warnin=
g
> >> anyway."
> >>
> >> What gives us confidence rs_name() will only be used where it doesn't
> >> really matter?
> >
> > The fact that all QAPI type definitions are (more or less by design) pu=
blic.
>
> Any particular reason not to use the same 'q_' prefix as in C?

The other Rust convention is that you usually have enums in CamelCase
(starting with an uppercase letter). "q_" or "Q_" would also trigger a
warning, and they would complicate to_camel_case a bit (because the
prefix would have to be kept including the underscore).

> >> This maps 'foo-0123-bar' to 'Foo_0123Bar'.  Intentional?  I'd kind of
> >> expect 'Foo0123Bar'.
> >
> > Will fix (it is meant for 0123-45).  New version is:
> >
> >    def to_camel_case(value: str) -> str:
> >        result =3D ''
> >        for p in re.split(r'[-_]+', value):
> >            if not p:
> >                pass
> >            elif p[0].isalpha() or (result and result[-1].isalpha()):
> >                result +=3D p[0].upper() + p[1:]
> >            else:
> >                result +=3D '_' + p
> >        return result
>
> Maps '0123-45' to '_0123_45'.  Is the leading '_' intentional?

Yes, because otherwise the output is not an identifier; but it doesn't
matter since the input is actually an identifier already and
to_camel_case('_0123_45') does give '_0123_45'. In neither case you
get the invalid identifier '0123_45'.

> I'm fine with not running rustfmt, and I'm fine with running it always
> (makes it a hard requirement).  Running it sometimes feels like more
> trouble than it's worth.

Yeah, I will drop it. I changed mcgen to allow removing empty lines in
the middle of a declaration, like this:

def mcgen(*code: T.Sequence[str], **kwds: object) -> str:
    '''
    Generate ``code`` with ``kwds`` interpolated.  Separate
    positional arguments represent separate segments that could
    expand to empty strings; empty segments are omitted and no
    blank lines are introduced at their boundaries.
    '''
    last =3D len(code) - 1
    result =3D []
    for i, s in enumerate(code):
        if s.startswith('\n'):
            s =3D s[1:]
        if i !=3D last:
            s =3D s.rstrip()
        s =3D cgen(s, **kwds)
        if s:
            result.append(s)
    return '\n'.join(result)

For the case of a single argument, the result is equivalent to the
existing implementation:

        # already checked by current mcgen()
        if s.startswith('\n'):
            s =3D s[1:]
        # skipped for a single argument
        if i !=3D last:
            s =3D s.rstrip()
        s =3D cgen(s, **kwds)
        if s:
            result.append(s)
    # result has zero or a single element, no '\n' added
    return '\n'.join(result)

Paolo


