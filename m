Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uMteL-0005zK-9d
	for mharc-qemu-rust@gnu.org; Wed, 04 Jun 2025 15:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uMteI-0005v6-TH
 for qemu-rust@nongnu.org; Wed, 04 Jun 2025 15:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uMteH-0005bh-AE
 for qemu-rust@nongnu.org; Wed, 04 Jun 2025 15:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749064778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oUtFymwOBl1v1lVcFvy8YpSJaKa5a8E2Q7YW1HX7ouw=;
 b=D3r/EOm0yr318IH/19cIZUIAkekfTCo4KE8t/YLFEfcSGTlcofM8h3ylEe8zXMWKQf/Zi1
 S/6tESVHjeMCpFfp7YCgI21AMShmeo4Ek5p2DewfGbtOryRz7inV7yR23RaNP5mvvG1BaL
 CuDooUD9bR5H6MrQTn/BXcIdbvoeAQc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-WJNjRSp3O4Sod8OcUAYe5A-1; Wed, 04 Jun 2025 15:19:37 -0400
X-MC-Unique: WJNjRSp3O4Sod8OcUAYe5A-1
X-Mimecast-MFC-AGG-ID: WJNjRSp3O4Sod8OcUAYe5A_1749064776
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4eeed54c2so106432f8f.3
 for <qemu-rust@nongnu.org>; Wed, 04 Jun 2025 12:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749064776; x=1749669576;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oUtFymwOBl1v1lVcFvy8YpSJaKa5a8E2Q7YW1HX7ouw=;
 b=qW96BHXr0gm0UmFZOToWaBPqXf/Hg64YkrZ697qKlgcvamnjgB/A7rz2U9+Wnq75Y4
 OVxRGHQO3vZPBZfkhu9/6C0lP5gCNRFCbKBZxavTY+bfZE9rNUZ2LlhL1wKEyPXR6D8m
 MZ9v/IzT2kcbhnCDeLPVZk7tfvTPiJBgJyqJX/PNgSIbBam+3b2HEHrS0Rd6kTLx0sXt
 dhnQUuWoDEyOwup/647y/SO239I8xwmIv51NyzA+Fvzhrii7OiBFGW/8DQGEm6bwVeBO
 zW2vx5K6yBfTh98Vv/oJGt8MTTRz6WkjC3ISieGIQXH1MB0zSuGLtT2dK8/QXfx4JyuZ
 RF2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtRwT9BtlaexTIP2mpNzV9S/hhwU6L7IMBBA2eVcISKBeyb2S+03yjDkmmVfnnthIzT+QtD9Jvagc=@nongnu.org
X-Gm-Message-State: AOJu0YxesQ7+UTYAKsNqvmlLCwXy1RR3rg30yaDvjKINntJ6150p+brI
 1YZUPtc8yWnieD0ZoC7Ey4D+IZ9mzexeDa7WtWfl3R3fj/eDQERQ5lqwzfb1rtqlDiR/NBwJVa3
 cxI+EKOJcOrAmAcKxE+Lx8OqHrUDtgIGfNrwUM0PBtdYsdyVl/bAE3r96xWShh80=
X-Gm-Gg: ASbGncu3roMjABV/nYFhTyzHWHALr/yibp4tTRYqa+169SGw5r3D6q420MfflHoNvfM
 DcgGNUahnr8WBUJO9nqR78RUN31FjD9O/q2fvE87u9rJpf9dU+Fbe+98mOoyQfpZXkbx2hroLQt
 q006KK7C5WI79hVn3JJc879k+Ea7NMtfVW6vRtJb4nT5G8WCDVjtuenJQyUtCsQuGcRbfKRuXrN
 d7QmhUnAFu4kT0juxjGAzLXKO75yiIJFfroPgYjFABvSCwobU3QJMfYbUpzqJg5LnZqIlEcJ3T1
 gKjciQWlpaXcow==
X-Received: by 2002:a05:6000:2f88:b0:3a0:a0d1:1131 with SMTP id
 ffacd0b85a97d-3a51d8f5ad7mr3279440f8f.7.1749064775915; 
 Wed, 04 Jun 2025 12:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv5qEgzMcNadqQrks8XNMvsUVD2PBC46PMEpFfhK0a2SpNDL7foBM89bL9ZHxUkR+LRbZGeQ==
X-Received: by 2002:a05:6000:2f88:b0:3a0:a0d1:1131 with SMTP id
 ffacd0b85a97d-3a51d8f5ad7mr3279429f8f.7.1749064775501; 
 Wed, 04 Jun 2025 12:19:35 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00971fasm22236655f8f.77.2025.06.04.12.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 12:19:34 -0700 (PDT)
Message-ID: <97b16175-8d2f-41f9-b305-a532acbad095@redhat.com>
Date: Wed, 4 Jun 2025 21:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] rust: qemu-api: add bindings to Error
To: Markus Armbruster <armbru@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250530080307.2055502-1-pbonzini@redhat.com>
 <20250530080307.2055502-7-pbonzini@redhat.com> <877c1uffj3.fsf@pond.sub.org>
 <aD7AbxghCc5VYDhu@intel.com> <8734ch5d5c.fsf@pond.sub.org>
 <2b7be73c-d91f-4820-a8ad-6964a8331150@redhat.com>
 <871ps02j8u.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <871ps02j8u.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _-EtR0nB9EFMoKDmLzbCtlosX3OcIOZWgUaQxYZYXfk_1749064776
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 04 Jun 2025 19:19:43 -0000

On 6/4/25 07:01, Markus Armbruster wrote:
> This is what your FOO_or_propagate() functions are for.
> 
> The rule glosses over a subtle detail: the difference between
> error_setg() and error_propagate() isn't just create a new error vs. use
> an existing one, namely error_setg() makes the precondition violation
> mentioned above a programming error, whereas error_propagate() does not,
> it instead *ignores* the error it's supposed to propagate.
> 
> I consider this difference a design mistake.  Note that GError avoids
> this mistake: g_error_propagate() requieres the destination to NULL or
> point to NULL.  We deviated from GError, because we thought we were
> smarter.  We weren't.
> 
> Mostly harmless in practice, as behavior is identical for callers that
> satisfy the preconditions.
> 
> [...]
> 
> So here's the bottom line.  We want a Rust function to use C Error
> according to its written rules.  Due to a design mistake, C functions
> can behave in two different ways when their caller violates a certain
> precondition, depending on how the function transmits the error to the
> caller.  For Rust functions, we can
> 
> * Always behave the more common way, i.e. like a C function using
>    error_setg() to transmit.
> 
> * Always behave the less common way, i.e. like a C function using
>    error_propagate() to transmit.
> 
> * Sometimes one way, sometimes the other way.
> 
> This is actually in order of decreasing personal preference.  But what
> do *you* think?
I agree that there are arguments for both.  The reason to use 
error_setg() is that, even though these functions "propagate" a 
qemu_api::Error into a C Error**, the error is born in the Rust callback 
and therefore there is no error_setg() anywhere that could check for 
non-NULL abort().  There is a bigger risk of triggering 
error_propagate()'s weird behavior.

The reason to use error_propagate() is that these functions do look a 
lot more like error_propagate() than error_setg().  I'm undecided.  I 
think I'll keep the error_setg() semantics, which is essentially

     assert_eq!(unsafe { *errp }, ptr::null_mut());

followed by calling bindings::error_propagate().

Paolo


