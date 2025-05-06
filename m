Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCFcO-0006d4-2T
	for mharc-qemu-rust@gnu.org; Tue, 06 May 2025 06:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCFcK-0006b1-M0
 for qemu-rust@nongnu.org; Tue, 06 May 2025 06:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCFcH-0003jB-55
 for qemu-rust@nongnu.org; Tue, 06 May 2025 06:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746527613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHMsoHwcRmM8GyjVZQfP1pBWTwp0nvQsTIV6VbWvmuc=;
 b=ReKhRmCXmHvqIduXnJVZm0fs8O7Q9YRXjdGe0Opx0cOOvRRVMZMSDVzvAxVBU63zJNGVOZ
 tg9ga9cYvxBh/DFxwmbVvdPD4YlXXC9R2rd9ffo/YrqtXGWvemlYucNYDD4d++8yDkjSlu
 lPVcA3a3rrjoq38N/cOMmz6AGGQBkVc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-SkKnWLShPLqi5m-Gd0qtXA-1; Tue, 06 May 2025 06:33:32 -0400
X-MC-Unique: SkKnWLShPLqi5m-Gd0qtXA-1
X-Mimecast-MFC-AGG-ID: SkKnWLShPLqi5m-Gd0qtXA_1746527611
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d733063cdso39854705e9.0
 for <qemu-rust@nongnu.org>; Tue, 06 May 2025 03:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746527610; x=1747132410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHMsoHwcRmM8GyjVZQfP1pBWTwp0nvQsTIV6VbWvmuc=;
 b=sRN/47S/kXU3Q0maH6BrMW0WpJ0tVnwIdd4V0i7B15QNOs2+hbQxwvjKCf2QrV4o5A
 wUj3/RI45NaD00HZipnbRZN+XMmkfUze4jzBtogMfkXXbLq9rwuTmfWBsVEQRQcWT8e5
 tl6PdskMc7xw6c4a2PbBVsL01CPK+0weC0QJuPhP4B4FnOkeyCdKubTYxfiAhS8Q54SD
 yEXbUIM1exf4mRulkyzSr0mVpJFOUzPIeGHgIuX9HCKAJ9IiIY0cbqgGsg/YP/bFd1vJ
 T1o1YSABUC1O2oCi/agbix6NuPLGLhBIVneF/bqq9JmGr6FZyNjWYJu+VPerji46Cr0G
 CPmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxpLz9Yz4Un4MBApR+wPcsxmcmQOWlR1upjwzfcupl3SmtAWQTLXYMmtB9Phk8jB4RI4xvBWHVanM=@nongnu.org
X-Gm-Message-State: AOJu0Yzt/0vD/5ymr54QocGlpvW+wWN0XFmQ/Ka/OneBm3XU0D4yxgGm
 zpJdwnkfA+qdc1i4ycgEknFHwShDQmcmFzLB24UCmheyoEz4lsEAfnan7jFlhCYM5Q0Cb5fm+vg
 Uw38jlxa2/g5oRhYhZzNbDSncIhiWnEUWAtpMHxIfX9pDH2uMLCQWMrLo3ytfhbm2utF7XdhPEp
 44v7UO1ER65FbV/W1/YN0kT2U1QXbtcatfpw==
X-Gm-Gg: ASbGncv8eFewPYDFbgfUGTKfDwAVIZgjhPgRZJK1bhjAHnMIJ9NnWPEXGtPH/C7FhST
 bn5Jsi7FDwIixRABmNjVQ8tefT/maD186J6UxVRwD4yFwV2N6g+r/LUBExkAReHal8Ry5
X-Received: by 2002:a05:600c:5105:b0:43c:e7a7:aea0 with SMTP id
 5b1f17b1804b1-441d100a80emr20486485e9.26.1746527610304; 
 Tue, 06 May 2025 03:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNHhif8jfiVQ97z+BXAWrm/CsBCuRtiWnMWXYZ+vontZg7flbaekF43yuJIawFQ6RcncEFZQ7f6xv1OU+FVVU=
X-Received: by 2002:a05:600c:5105:b0:43c:e7a7:aea0 with SMTP id
 5b1f17b1804b1-441d100a80emr20486255e9.26.1746527609952; Tue, 06 May 2025
 03:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250505100854.73936-1-pbonzini@redhat.com>
 <20250505100854.73936-4-pbonzini@redhat.com>
 <aBncq8KFTgzcT3jv@intel.com>
In-Reply-To: <aBncq8KFTgzcT3jv@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 6 May 2025 12:33:17 +0200
X-Gm-Features: ATxdqUFKc370bpFxdrNgK4Lj-P5sRATe4xaagwdtzVix-xsXOtI0wcrxeuK1TBo
Message-ID: <CABgObfYAw92Fy8PUPEf5=vJG2N_O3-pt754QoFLLgfQu9JB-0A@mail.gmail.com>
Subject: Re: [PATCH 3/5] rust: vmstate: convert to use builder pattern
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ea7IwNeW_7dfSh3JPA9hxTgX0dd65N5zBLvDOra8s30_1746527611
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 06 May 2025 10:33:40 -0000

On Tue, May 6, 2025 at 11:35=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> > +unsafe extern "C" fn vmstate_pre_load_cb<
> > +    T,
> > +    F: for<'a> FnCall<(&'a T,), Result<(), impl Into<Errno>>>,
> > +>(
> > +    opaque: *mut c_void,
> > +) -> c_int {
> > +    // SAFETY: assumes vmstate_struct! is used correctly
> > +    let result =3D F::call((unsafe { &*(opaque.cast::<T>()) },));
> > +    into_neg_errno(result)
>
> Thanks! Now I see why you used io::ErrorKind.
>
> > +}
>
> ...
>
> > +    #[must_use]
> > +    pub const fn pre_load<F: for<'a> FnCall<(&'a T,), Result<(), impl =
Into<Errno>>>>(
> > +        mut self,
> > +        _f: &F,
> > +    ) -> Self {
>
> Do we need to assert F is not ()?
>
> const { assert!(F::IS_SOME) };

A NULL callback (i.e. ".pre_load(())") is a bit weird but acceptable.
So the assertion if not needed, but indeed there should be an "if"
that stores "ptr::null()" instead of vmstate_pre_load_cb::<F>.

Paolo


