Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uCFyq-0002cs-Fg
	for mharc-qemu-rust@gnu.org; Tue, 06 May 2025 06:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCFyn-0002WG-Bt
 for qemu-rust@nongnu.org; Tue, 06 May 2025 06:56:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uCFyl-0006K7-K7
 for qemu-rust@nongnu.org; Tue, 06 May 2025 06:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746529009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvLU8i4sTYOylp/4hBHbK3K6hp+qzpClbnpviMvVgrk=;
 b=WTh9Ye1Q7+vLwVUWsuCn4H/k2blS5bEWRYfj8U/Kkl9RSDqZm8MzTOJI0Fsb8HhfNsd62q
 ncFKhNKjF58TfvPL8OAaaPKBsOEqeBOAd8yo+UgXibUdxyEQt5L00GOiIdcD1BMhrjVhrb
 slQk233/XyBLZMVfgcS83wGXdwUe/lM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-Um0Uk7alM7ubUvoiPt6low-1; Tue, 06 May 2025 06:56:48 -0400
X-MC-Unique: Um0Uk7alM7ubUvoiPt6low-1
X-Mimecast-MFC-AGG-ID: Um0Uk7alM7ubUvoiPt6low_1746529007
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39ac9b0cb6aso2269252f8f.2
 for <qemu-rust@nongnu.org>; Tue, 06 May 2025 03:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746529007; x=1747133807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kvLU8i4sTYOylp/4hBHbK3K6hp+qzpClbnpviMvVgrk=;
 b=KsRddV3VZgipKLw9KxRcRtE6T/z3NA91ayuXVSjrPnPFyd65raRnZcbJ9rRzpSoFn8
 42MV1QNqHl0I8Wq3strKbkqVguKQyXBkgyxSY9ihsjsjyfyD/OK5VxUFzTW317l3OA2c
 WTpJ50x8C3wu9C4OEawPCZBpT6WCm0zRR2hgsK6Le7jhJZL7QAO25Bq99sq9KbZE0Kwl
 oyuaCjYIW0GeNyKwUststMd+DfGZ8nzdmY1MT1Q1ywch7BZMJyfYYQSkHV8UTwYtekPD
 UsvB+6GFX3n6TvFcX9CDocxc0mkHvPqrcKQ6NZTOXatboxgVWqwJ0eWdzXjvz0WedS7u
 v49Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR1XG9C/r3uE2luZdIquBqZ1fh6AnM7LK792cJ6seRRVf4gGRXesJnYWFSct1YyR0Psf2qS4yf9V4=@nongnu.org
X-Gm-Message-State: AOJu0YyAhfQgTuu6utHVaaBOn7fOJDdKq5Z6p91uge1WCP7HMIDuKcqH
 p4bdbYuPOqCwNqPTl4fY7Wmd4CT95ZB+431MGFn/I+kuEaGcAeTJlhnzAj3y/hB3bCcT4orwpcy
 LASH1b0NppgfypiBR6ygl0Nysb/aJZ3sS9bJ5svgnqSJP7Tz/KktfEqiarBLRfhcZA+S37nWJgY
 FX63RSHFYICTJ2M6B/ZlCOsoVbKQ==
X-Gm-Gg: ASbGnctXf7oZ707hEHlyqH92HEQnS2VTKUtG+lEB3soYoTZfSaBylBRLR0u1xdG4N1a
 91q8tVBwErdjLCqHDRMm+ygmFgcjYMULZw18CGw1o3iDVMOGrdk4ad4hiMnsznmm2G6PK
X-Received: by 2002:a5d:598f:0:b0:38f:28dc:ec23 with SMTP id
 ffacd0b85a97d-3a0ac0da194mr1915422f8f.19.1746529007495; 
 Tue, 06 May 2025 03:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7sFP5dX58k2E/Xh1xdbQ7puHXYJcIDV06y0PeV8wfKkQAUmH9eswmsEAdMi6J1AAV2gVfS4m0fp5D0C49sCA=
X-Received: by 2002:a5d:598f:0:b0:38f:28dc:ec23 with SMTP id
 ffacd0b85a97d-3a0ac0da194mr1915410f8f.19.1746529007259; Tue, 06 May 2025
 03:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250505100854.73936-1-pbonzini@redhat.com>
 <20250505100854.73936-3-pbonzini@redhat.com>
 <aBnSUzH1RuYp123b@intel.com>
In-Reply-To: <aBnSUzH1RuYp123b@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 6 May 2025 12:56:34 +0200
X-Gm-Features: ATxdqUG3NgKZCj8uy6wsqkLbcwlR69f-HcA1wtXuvWTRYicNBlKwwcahkfNYbPI
Message-ID: <CABgObfZ3uutsJUMwEcoZpJ-WwxWwfFrAfq6_9TGkFekOM3UXHg@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: use inline const expressions
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bAxRNwiCxnPyG8gGqydrrQhiPax4AUJ_23nu7X_-WPI_1746529007
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
X-List-Received-Date: Tue, 06 May 2025 10:56:53 -0000

On Tue, May 6, 2025 at 10:51=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
> > -        let _: () =3D CanReceiveFn::ASSERT_IS_SOME;
> > +        const { assert!(CanReceiveFn::IS_SOME) };
>
> Do you think it's a good idea to warp this as a helper for easy
> callback calls?

I think the wrapper would be very similar to what exists before this
patch, wouldn't it? The const { assert!(...) } seems clear enough and
not too verbose.

Paolo


